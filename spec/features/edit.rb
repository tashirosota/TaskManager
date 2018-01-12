require 'rails_helper'

feature "編集画面" do
  background do
    @task=Task.create!(title: 'test', memo: 'hogehoge')
    visit edit_task_path(id: @task.id)
  end
  
  scenario 'コンテンツ一覧' do
    expect(page).to have_content 'タスク編集画面です。'
    expect(page).to have_content 'タスク名 :  '
    expect(page).to have_content '終了期限 : '
    expect(page).to have_content 'メモ : '
    expect(page).to have_content '優先度 : '
    expect(page).to have_content '進捗 : '
    expect(page).to have_content 'ラベル : '
  end

  
  scenario 'CHECKボタン' do
    expect(page).to have_button 'CHECK'
    click_on 'CHECK'
    expect(page).to have_content 'タスクが編集されました。'
  end
end