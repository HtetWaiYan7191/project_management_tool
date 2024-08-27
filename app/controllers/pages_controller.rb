# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:welcome, :landing]
  skip_before_action :set_tenant, only: [:landing, :welcome]
  def landing; end

  def welcome; end

  def home
    @cards = [{
      title: "Annoucement",
      description: "Post Annoucement, pitch ideas and gather feedback while keeping discussions organized and on-topic",
      link: annoucements_path,
    }, {
      title: "Chat",
      description: 'Chat casually with people, ask questions, connect with your team, and share news without ceremony',
      link: annoucements_path,

    }, {
      title: 'Doc & Files',
      description: 'Centralized place to organized and share docs, spreadsheets, images and other files',
      link: annoucements_path
    }]
  end 
end
