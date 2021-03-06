require 'olm/app'

module Olm
  VERSION = '0.1.3'

  extend self

  def app
    Olm::App.instance
  end

  def default_folder_id
    puts app.default_folder.EntryID
  end

  def deleted_items_folder_id
    puts app.deleted_items_folder.EntryID
  end

  def ls(folder_id = nil)
    app.ls(folder_id).each do |line|
      $stdout.puts(line)
    end
  end

  def send_and_receive
    app.send_and_receive
  end

  def message(entry_id)
    app.message(entry_id).each do |line|
      $stdout.puts line
    end
  end

  def toggle_task_flag(entry_id)
    app.toggle_task_flag(entry_id)
  end

  def mark_as_read(entry_id)
    app.mark_as_read(entry_id)
  end

  def save_message
    app.create_message(ARGF).Save
  end

  def send_message
    app.create_message(ARGF).Send
  end

  def create_reply_all_message(entry_id)
    reply_mail_entry_id = app.create_reply_all_message(entry_id)
    message(reply_mail_entry_id)
  end

  def create_forward_message(entry_id)
    forward_mail_entry_id = app.create_forward_message(entry_id)
    message(forward_mail_entry_id)
  end

  def update_message_body_and_save
    app.update_message_body(ARGF).Save
  end

  def update_message_body_and_send
    app.update_message_body(ARGF).Send
  end

  def update_forward_message_body_and_save
    app.update_forward_message_body(ARGF).Save
  end

  def update_forward_message_body_and_send
    app.update_forward_message_body(ARGF).Send
  end

  def save_attachments(entry_id, path)
    app.save_attachments(entry_id, path)
  end

  def execute_refile
    app.execute_refile(ARGF)
  end
end
