# encoding: utf-8

path = File.expand_path '../', __FILE__
PATH = path

require "#{path}/config/env.rb"


class Marcomazzi < Sinatra::Base
  include Voidtools::Sinatra::ViewHelpers

  MAIN_EMAIL = "marco_mazzi@hotmail.com"

  LAYOUT_MAX_WIDTH = 1100

  # partial :comment, { comment: "blah" }
  # partial :comment, comment

  def partial(name, value)
    locals = if value.is_a? Hash
      value
    else
      hash = {}; hash[name] = value
      hash
    end
    haml "_#{name}".to_sym, locals: locals
  end

  # helpers

  def subpath(url=request.path)
    url.split("/")[1]
  end

  def nav_link_to(label, url, options={})
    if subpath == subpath(url)
      options[:class] = "current #{options[:class]}".strip
    elsif url == "/" && subpath.nil?
      options[:class] = "current #{options[:class]}".strip
    end
    link_to label, url, options
  end

end

require_all "#{path}/routes"