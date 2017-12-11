require 'nokogiri'
require 'json'
require 'open-uri'
require 'awesome_print'
require 'rest-client'
require 'httparty'
require 'csv'
require 'pry'

# $stack_name = ["android-development","angular","apache-spark","asp-net","backbone-js","bootstrap","c","c-sharp","c-plus-plus","cassandra","chef","clojure","css","d3-js","django","docker","elasticsearch","elixir","flask","git","go","graphql","gulp","hadoop","haskell","html5","swift","java","spring","javascript","jenkins","jquery","julia","kotlin","kubernetes","laravel","mongodb","mysql","nginx","node-js","php","polymer","python","r","react","redis","rust","sap-abap","sass","scala","sql","sql-server","typescript","unity","visual-basic-vb","vue-js","cobol","codeIgniter","coffeeScript","couchdb","dart","elm","ember-js","erlang","grunt","less","lua","objective-c","postgres","meteor","opencv","opengl","perl","sinatra"]

$stack_name = ["android-development"]


DATA.each do |stack|
  url = URI.encode "https://hackr.io/tutorials/learn-#{stack.strip}"
  res = HTTParty.get(url)
  text = Nokogiri::HTML(res.body)

  result = []
  contents = text.css('.tut-list.tut-row .title-links a')
  contents.each do |content|
    link = content['href']
    result << link
  end

  edu_links = []
    result.each do |url|
      res = HTTParty.get(url)
      text = Nokogiri::HTML(res.body)
      contents = text.css('a.btn-visit-tut')
      contents.each do |content|
        link = content['href']
        edu_links << link
      end
      # puts edu_links
    end


File.open("edu_path.csv", "a") do |file|
      $stack_name.each_with_index do |file2, index|
          file.write(file2)
          file.write("@@$^")
          file.write(edu_links.join(",").gsub(/,\s+\"/,',\"'))
          file.write("\n")
      end
  end

end

__END__
android-development
# angular
# apache-spark
# asp-net
# backbone-js
# bootstrap
# c
# c-sharp
# c-plus-plus
# cassandra
# chef
# clojure
# css
# d3-js
# django
# docker
# elasticsearch
# elixir
# flask
# git
# go
# graphql
# gulp
# hadoop
# haskell
# html5
# swift
# java
# spring
# javascript
# jenkins
# jquery
# julia
# kotlin
# kubernetes
# laravel
# mongodb
# mysql
# nginx
# node-js
# php
# polymer
# python
# r
# react
# redis
# rust
# sap-abap
# sass
# scala
# sql
# sql-server
# typescript
# unity
# visual-basic-vb
# vue-js
# cobol
# codeIgniter
# coffeeScript
# couchdb
# dart
# elm
# ember-js
# erlang
# grunt
# less
# lua
# objective-c
# postgres
# meteor
# opencv
# opengl
# perl
# sinatra
