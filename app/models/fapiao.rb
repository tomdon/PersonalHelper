class Fapiao < ActiveRecord::Base
	validates :fcode, presence:true, uniqueness:true, length:{ minimum:8 }, numericality:true
	#驗證 fcode 欄位 是否為空, 是否唯一, 是否為8個字元, 是否為數字
end
