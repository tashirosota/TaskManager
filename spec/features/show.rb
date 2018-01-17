require 'rails_helper'

feature "詳細画面" do
  background do
    @task=Task.create!(title: 'test', memo: 'hogehoge')
    visit task_path(id: @task.id)
  end
  
  scenario 'EDITリンク' do
    expect(page).to have_link 'EDIT'
    click_on 'EDIT'
    expect(page).to have_content 'タスク編集画面です。'
  end
  
  scenario 'DELETEリンク' do
    expect(page).to have_link 'DELETE'
    click_on 'DELETE'
    expect(page).to have_content 'タスクが削除されました。'
  end
end