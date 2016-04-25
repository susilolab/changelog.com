defmodule Changelog.EpisodeView do
  use Changelog.Web, :view

  def audio_url(episode) do
    "/" <> Changelog.AudioFile.url({episode.audio_file.file_name, episode}, :original)
  end

  def guid(episode) do
    episode.guid || "changelog.com/#{episode.podcast_id}/#{episode.id}"
  end

  def numbered_title(episode) do
    case Float.parse(episode.slug) do
      {_, _} -> "#{episode.slug}: #{episode.title}"
      :error -> episode.title
    end
  end
end
