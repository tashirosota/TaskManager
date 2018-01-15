require 'rails_helper'

feature "登録画面" do
  background do
    @task=Task.create!(title: 'test', memo: 'hogehoge')
    visit new_task_path
  end
  
  scenario 'コンテンツ一覧' do
    expect(page).to have_content 'タスク登録画面です。'
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
    expect(page).to have_content '新しいタスクが登録されました。'
  end
end