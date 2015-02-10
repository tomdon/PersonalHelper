class FapiaoController < ApplicationController

  def index
    @fapiao = Fapiao.new
    @fpshow = Fapiao.page(params[:page]).per(5).order("id desc")
    require 'net/http'
    uri = URI('http://invoice.etax.nat.gov.tw/')
    @externalInfo = Net::HTTP.get(uri).force_encoding("utf-8")
    @exIndexHead = @externalInfo.index("無實體電子發票專屬獎中獎號碼")+23
    @exIndexLast = @externalInfo.index("</table>")
    @externalInfo = @externalInfo[@exIndexHead..@exIndexLast+7]
    
    
  end
   
  def create
    @fapiao = Fapiao.new(params.require(:fapiao).permit(:fcode))
    @fapiao.save
    redirect_to :controller => :fapiao,:action => :index
  end

  def destroy
	Fapiao.destroy_all
  
  redirect_to :action =>:index
  end
	private
  def checkfp(fcode)#將括弧內的發票號碼比對當期中獎號碼,回傳fail或中的獎項
  	@xx = @externalInfo#複製get來的原始碼
  	@Super = @xx[@xx.index("class=\"t18Red\">")+15,8]#分割出特別獎的號碼
  	@xx = @xx[@xx.index("class=\"t18Red\">")+23..-1]#把前面已經沒用的部份割掉
  	@SP = @xx[@xx.index("class=\"t18Red\">")+15,8]#分割出特獎號碼
  	@xx = @xx[@xx.index("class=\"t18Red\">")+23..-1]#把前面已經沒用的部份割掉
  	@Head1 = @xx[@xx.index("class=\"t18Red\">")+15,8]#分割出特獎號碼1
  	@xx = @xx[@xx.index("class=\"t18Red\">")+23..-1]#把前面已經沒用的部份割掉
  	@Head2 = @xx[@xx.index("、")+1,8]#分割出特獎號碼2
  	@xx = @xx[@xx.index("、")+9..-1]#把前面已經沒用的部份割掉
  	@Head3 = @xx[@xx.index("、")+1,8]#分割出特獎號碼3
  	@xx = @xx[@xx.index("、")+9..-1]#把前面已經沒用的部份割掉
  	@Bonus1 = @xx[@xx.index("class=\"t18Red\">")+15,3]#分割出增開獎1
  	@xx = @xx[@xx.index("class=\"t18Red\">")+18..-1]#把前面已經沒用的部份割掉
  	@Bonus2 = @xx[@xx.index("、")+1,3]#分割出增開獎2
  	@xx = @xx[@xx.index("、")+4..-1]#把前面已經沒用的部份割掉
  	@Bonus3 = @xx[@xx.index("、")+1,3]#分割出增開獎3
  	@xx = @xx[@xx.index("、")+4..-1]#把前面已經沒用的部份割掉
  	@Bonus4 = @xx[@xx.index("、")+1,3]#分割出增開獎4
  	if compare(fcode,@Super)==8
  		return "Super"
  	elsif compare(fcode,@SP)==8
  		return "SP"
  	elsif compare(fcode,@Head1)==8
  		return "Head"  	
  	elsif compare(fcode,@Head2)==8
  		return "Head"  	
  	elsif compare(fcode,@Head3)==8
  		return "Head"  	
  	elsif compare(fcode,@Head1)==7
  		return "H2"  	
  	elsif compare(fcode,@Head2)==7
  		return "H2"  	
  	elsif compare(fcode,@Head3)==7
  		return "H2"  	
  	elsif compare(fcode,@Head1)==6
  		return "H3"  	
  	elsif compare(fcode,@Head2)==6
  		return "H3"  	
  	elsif compare(fcode,@Head3)==6
  		return "H3"  	
  	elsif compare(fcode,@Head1)==5
  		return "H4"  	
  	elsif compare(fcode,@Head2)==5
  		return "H4"  	
  	elsif compare(fcode,@Head3)==5
  		return "H4"  
  	elsif compare(fcode,@Head1)==4
  		return "H5"  	
  	elsif compare(fcode,@Head2)==4
  		return "H5"  	
  	elsif compare(fcode,@Head3)==4
  		return "H5"  
  	elsif compare(fcode,@Head1)==3
  		return "H6"  	
  	elsif compare(fcode,@Head2)==3
  		return "H6"  	
  	elsif compare(fcode,@Head3)==3
  		return "H6"  
  	elsif compare(fcode,@Bonus1)==99
  		return "Bonus"
  	elsif compare(fcode,@Bonus2)==99
  		return "Bonus"  
  	elsif compare(fcode,@Bonus3)==99
  		return "Bonus"  
  	elsif compare(fcode,@Bonus4)==99
  		return "Bonus"
  	else
  		return "fail"
  	end
  end
  
  def compare(a,b) #由右向左比對號碼,回傳相同號碼的數量
  same = 0
	if b.mb_chars.length == 3 
		if a[5,3]==b
			same = 99
		end
	else
	step = 7	
	while step >=0
		if a[step]==b[step]
			same = same+1
			step = step-1
		else
			step = step - 99
		end
	end
	end
	return same
  end
  
  private
  helper_method :checkfp #讓checkfp能夠在views裡面被呼喚
  helper_method :compare #讓compare能夠在views裡面被呼喚

end
