class Netflix < MovieCollection
  attr_reader :deposit
  def initialize filmfile, firstpay 
    super
    @deposit = firstpay
  end

  def pay(deposit)
      @deposit += deposit
  end

  def payment(cost)
    raise "Извините! У вас недостаточно средств на счете" unless  (@deposit-cost) >= 0
    @deposit-=cost
  end 
   
  def show(filters)

    if filters[:period]
      filters[:year] = period[filters[:period]]
      period = filters[:period]
      filters.delete(:period)
    end
    
    filter(filters).sort_by { rand }.first(1).each{|f| puts " Фильм: #{ f.description } #{ f.watch } " }

  end

  def watch(film)
    filter(name: film).each{ |f| puts " Фильм: #{ f.description } #{ f.watch } " }
  end

  def how_much?(film)
    filter(name: film).each{ |f| print "#{ f.description } - просмотр фильма стоит $#{ f.cost }, на вашем счете   $#{ @deposit } \n" }
  end

end