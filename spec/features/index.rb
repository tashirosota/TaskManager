require 'rails_helper'

feature "一覧表示画面" do
  background do
    Task.create!(title: 'test1', memo: 'hogehoge1', created_at: "2017-12-14 05:16:43", line: "2017-12-14 05:16:43")
    Task.create!(title: 'test2', memo: 'hogehoge2', created_at: "2013-12-29 05:16:43", line: "2013-12-29 05:16:43")
    Task.create!(title: 'test3', memo: 'hogehoge3', created_at: "2018-12-28 05:16:43", line: "2018-12-28 05:16:43")
    visit tasks_path
  end
     
  scenario 'SORT BY CREATED_AT_DESC' do
    p "SORT BY CREATED_AT_DESC"
    expect(page).to have_link 'SORT BY CREATED_AT_DESC'
    click_on 'SORT BY CREATED_AT_DESC'
    expect(find('h5',match: :first)).to have_content 'test3' 
    save_and_open_page
  end

  scenario 'SORT BY DEAD_LINE' do
    p "SORT BY DEAD_LINE"
    expect(page).to have_link 'SORT BY DEAD_LINE'
    click_on 'SORT BY DEAD_LINE'
    expect(find('h5',match: :first)).to have_content 'test2'
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