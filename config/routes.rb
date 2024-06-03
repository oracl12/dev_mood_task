# frozen_string_literal: true

Rails.application.routes.draw do
  get 'music_records/new'
  get 'music_records/edit'
  get 'music_records/create'
  get 'music_records/update'
  get 'music_records/destroy'
  get 'users/new'
  get 'users/edit'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  post 'users/order' => 'users#order'
end
