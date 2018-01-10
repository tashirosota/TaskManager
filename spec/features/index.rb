require 'rails_helper'

feature "一覧表示画面" do
  background do
    Task.create!(title: 'test1', memo: 'hogehoge1', created_at: "2017-12-14 05:16:43")
    Task.create!(title: 'test2', memo: 'hogehoge2', created_at: "2013-12-29 05:16:43")
    Task.create!(title: 'test3', memo: 'hogehoge3', created_at: "2018-12-28 05:16:43")    
    visit root_path_url
  end
     
  scenario 'for_desk' do
    p "for_desk"
    expect(find('h5',match: :first)).to have_content 'test3' 
    save_and_open_page
  end
    
  scenario 'CREATEリンク'  do 
    expect(page).to have_link 'CREATE'
    click_on 'CREATE'
    expect(page).to have_content 'タスク登録画面です。'
  end
  
  scenario 'DETAILリンク' do
    expect(page).to have_link 'DETAIL'
    click_on 'DETAIL',  match: :first
    expect(page).to have_content 'タスクの詳細画面です。'
  end
end