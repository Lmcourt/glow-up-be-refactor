require 'rails_helper'

RSpec.describe HabitEntry, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :habit }
  end

  describe 'mutations' do
    let!(:user) { create :user }
    let!(:habit) { create :habit }
    let!(:habits) { create_list :habit, 14 }

    before { HabitEntry.create_entries(user, [{ id: habit.id }]) }

    it 'creates habit entries for completed habits' do
      expect(user.habit_entries.count).to eq(1)
    end

    it 'can update habit entries' do
      expect(user.habit_entries.count).to eq(1)
    end

    it 'is date sensitive' do
      create(:habit_entry, user_id: user.id, habit_id: habit.id, created_at: Date.today - 1)

      expect(user.habit_entries.count).to eq(2)
    end

    it 'can destroy all entries for today' do
      create(:habit_entry, user_id: user.id, habit_id: habit.id, created_at: Date.today - 1)
      create_list(:habit_entry, 3, user_id: user.id, habit_id: habit.id)

      HabitEntry.destroy_today_entries(user)

      expect(user.habit_entries.count).to eq(1)
    end
  end

  describe 'daily completed' do
    let!(:user) { create :user }
    let!(:habits) { create_list :habit, 5 }
    let!(:completed_today) { create_list :habit_entry, 2, user_id: user.id }
    let!(:completed_yesterday) { create_list :habit_entry, 2, created_at: Date.today - 1, user_id: user.id }

    it 'has all completed today' do
      expect(user.habit_entries.daily_completed).to eq(completed_today.map(&:habit_id))
    end

    describe 'formatting created at' do
      let(:formatted_date) { completed_today.first.created_at.strftime('%m/%d/%Y') }

      it 'formats the mood' do
        expect(completed_today.first.date).to eq formatted_date
      end
    end
  end
end
