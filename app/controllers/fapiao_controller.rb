class FapiaoController < ApplicationController

  def index
    @fapiao = Fapiao.new
    @fpshow = Fapiao.page(params[:page]).per(5)
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
  @delFp = Fapiao.find(params[:id])
  @delFp.destroy
  
  redirect_to :action =>:index
  end
end
