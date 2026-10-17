# frozen_string_literal: true

require "download_strategy"
require "utils/github"

# Private GitHub release assets 404 on the public /releases/download/ URL.
# Download via the Releases API using HOMEBREW_GITHUB_API_TOKEN.
class GitHubPrivateRepositoryReleaseDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    match = url.match(%r{\Ahttps://github\.com/(?<owner>[^/]+)/(?<repo>[^/]+)/releases/download/(?<tag>[^/]+)/(?<file>.+)\z})
    raise CurlDownloadStrategyError, "Unexpected GitHub release URL: #{url}" unless match

    @owner = match[:owner]
    @repo = match[:repo]
    @tag = match[:tag]
    @filename = match[:file]
    @github_token = ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)
    return if @github_token.present?

    raise CurlDownloadStrategyError,
          "Set HOMEBREW_GITHUB_API_TOKEN to a PAT that can read #{@owner}/#{@repo}."
  end

  private

  def _fetch(url:, resolved_url:, timeout:)
    release = GitHub::API.open_rest(
      "#{GitHub::API_URL}/repos/#{@owner}/#{@repo}/releases/tags/#{@tag}",
    )
    asset = Array(release["assets"]).find { |item| item["name"] == @filename }
    raise CurlDownloadStrategyError, "Release asset #{@filename} not found on #{@tag}" if asset.nil?

    api_url = "#{GitHub::API_URL}/repos/#{@owner}/#{@repo}/releases/assets/#{asset["id"]}"
    curl_download api_url,
                  "--header", "Authorization: Bearer #{@github_token}",
                  "--header", "Accept: application/octet-stream",
                  to: temporary_path,
                  timeout: timeout
  end
end
