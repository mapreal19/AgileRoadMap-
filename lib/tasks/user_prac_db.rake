namespace :user_prac_db do
  desc "Set margen no definido si nil"
  task set_range_to_no_definido: :environment do
  	 UserPractica.all.each do |t|
  	 	if t.range == nil
  	 		t.update_attribute :range, -1
  	 	end
    end
  end

end
