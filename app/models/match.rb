class Match < ApplicationRecord
  belongs_to :owner_team, class_name: "TeamPlay"
  belongs_to :guest_team, class_name: "TeamPlay"
  has_many :games, dependent: :destroy
#  has_many :line_results, dependent: :destroy

  def owner_total_score #neu kieu line_result nhu Quy thi no chi la 1 phan tu chu dau phai 1 array
    owner_score = line_results.inject(0.0) {|sum, e| sum + e.owner_score }
  end 

  def guest_total_score 
    guest_score = line_results.inject(0.0) {|sum, e| sum + e.guest_score }
  end 

  def final_winner 
    owner_total_score > guest_total_score ? owner_team : guest_team 
  end 

  def final_loser 
    owner_total_score < guest_total_score ? owner_team : guest_team 
  end 

end
