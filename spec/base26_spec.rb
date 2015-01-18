require_relative './spec_helper'

describe Base26 do

  before :all do
    @a = Base26.new()
  end

  it "a is an instance of Base26" do
    expect(@a).to be_instance_of(Base26)
  end

  it "@a[0] should return a" do expect( @a.toBase26[0] ).to eq('a') end
  it "@a[25] should return z" do expect( @a.toBase26[25] ).to eq('z') end

  it "@a['a'] should return 0" do expect(@a.toBase10['a']).to eq(0) end
  it "@a['z'] should return 25" do expect(@a.toBase10['z']).to eq(25) end

  it "@a.lookup_base26(0) should return a" do expect( @a.lookup_base26(0) ).to eq('a') end
  it "@a.lookup_base10('z') should return 25" do expect( @a.lookup_base10('z') ).to eq(25) end

  it "@a.to_base26(0) should return a" do expect( @a.to_base26(0) ).to eq('a') end
  it "@a.to_base26(1) should return b" do expect( @a.to_base26(1) ).to eq('b') end
  it "@a.to_base26(26) should return ba" do expect( @a.to_base26(26) ).to eq('ba') end
  it "@a.to_base26(678) should return bac" do expect( @a.to_base26(678) ).to eq('bac') end

  it "@a.to_base10('bac') should return 678" do expect( @a.to_base10('bac') ).to eq(678) end
  it "@a.to_base10('luna') should return 207194" do expect( @a.to_base10('luna') ).to eq(207194) end
  it "@a.to_base10('lina') should return 199082" do expect( @a.to_base10('lina') ).to eq(199082) end
  it "@a.to_base26(lina+luna) should return bac" do expect( @a.to_base26(207194 + 199082) ).to eq('xdaa') end

  it "@a.to_base10('is') should return 226" do expect( @a.to_base10('is') ).to eq(226) end
  it "@a.to_base10('and') should return 341" do expect( @a.to_base10('and') ).to eq(341) end
  it "@a.to_base26(is + and) should return vv" do expect( @a.to_base26(226+341) ).to eq('vv') end

  it "@a.to_base10('dota') should return 62686" do expect( @a.to_base10('dota') ).to eq(62686) end
  it "@a.to_base10('is') should return 226" do expect( @a.to_base10('is') ).to eq(226) end
  it "@a.to_base10('ijlegcod') should return 341" do expect( @a.to_base10('ijlegcod') ).to eq(67167353607) end
  it "@a.to_base26(dota + is + ijlegcod) should return vv" do
    expect( @a.to_base26(226+62686+67167353607) ).to eq('ijlejrpv')
  end

  it "@a.to_base10('ijlejrpv') should return 226+62686+67167353607" do
    expect( @a.to_base10('ijlejrpv') ).to eq(226+62686+67167353607)
  end


  str = '[([dota + is + ijlegcod]/[a*(game^of^love) + b])*zanroo ] + tmfafj'
  it "@a.tokenize(str) should return array of token" do
    expect( @a.tokenize(str).length ).to eq(10)
  end

  it "@a.run('{ [([dota + is + ijlegcod]/[a*(game^of^love) + b])*zanroo ] + tmfafj = }') should give ibgdotaallstar" do
    expect( @a.run(str) ).to eq('ibgdotaallstar')
  end

  it "@a.run('lina + luna') should give xdaa" do
    expect( @a.run('lina + luna') ).to eq('xdaa')
  end

end
