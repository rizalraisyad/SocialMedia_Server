require_relative "../../models/post.rb"
describe Posts do
  before :each do
    @posts_data = [
      {
        id: 3, 
        id_user: 1, 
        caption: 'Selamat siang para pelajar', 
        attachment: '/public/upload/test.jpg', 
        createdAt: '2021-08-20 11:48:38'
      },
      {
        id: 1, 
        id_user: 2, 
        caption: 'Selamat makans', 
        attachment: '/public/upload/test2.jpg', 
        createdAt: '2021-08-20 11:48:38'
      }
    ]
    @client = double
    allow(Mysql2::Client).to receive(:new).and_return(@client)
  end

  it 'should fullfill attributes initialize' do
    post_data = 
    post = Posts.new(
      id: @posts_data[0][:id], 
      id_user: @posts_data[0][:id_user],
      caption: @posts_data[0][:caption],
      attachment: @posts_data[0][:attachment],
      createdAt: @posts_data[0][:createdAt],
    )

    expect(post.id).to eq(@posts_data[0][:id])
    expect(post.id_user).to eq(@posts_data[0][:id_user])
    expect(post.caption).to eq(@posts_data[0][:caption])
    expect(post.attachment).to eq(@posts_data[0][:attachment])
    expect(post.createdAt).to eq(@posts_data[0][:createdAt])
  end

  context 'validation' do
    it 'return true' do
      post = Posts.new(
      id: @posts_data[0][:id], 
      id_user: @posts_data[0][:id_user],
      caption: @posts_data[0][:caption],
      attachment: @posts_data[0][:attachment],
      createdAt: @posts_data[0][:createdAt],
    )
    expect(post.valid?).to be(true)
    end
    it 'return false cause iduser nil' do
      post = Posts.new(
      id: @posts_data[0][:id],
      caption: @posts_data[0][:caption],
      attachment: @posts_data[0][:attachment],
      createdAt: @posts_data[0][:createdAt],
    )
    expect(post.valid?).to be(false)
    end
    it 'return false cause caption "" or nill' do
      post = Posts.new(
      id: @posts_data[0][:id], 
      id_user: @posts_data[0][:id_user],
      caption: "",
      attachment: @posts_data[0][:attachment],
      createdAt: @posts_data[0][:createdAt],
    )
    expect(post.valid?).to be(false)
    end
    it 'return false cause caption more then 1000' do
      post = Posts.new(
      id: @posts_data[0][:id], 
      id_user: @posts_data[0][:id_user],
      caption: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Praesent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac placerat dolor lectus quis orci. Phasellus consectetuer vestibulum elit. Aenean tellus metus, bibendum sed, posuere ac, mattis non, nunc. Vestibulum fringilla pede sit amet augue. In turpis. Pellentesque posuere. Praesent turpis. Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus. Donec elit libero, sodales nec, volutpat a, suscipit non, turpis. Nullam sagittis. Suspendisse pulvinar, augue ac venenatis condimentum, sem libero volutpat nibh, nec pellentesque velit pede quis nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce id purus. Ut varius tincidunt libero. Phasellus dolor. Maecenas vestibulum mollis diam. Pellentesque ut neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dui magna, posuere eget, vestibulum et, tempor auctor, justo. In ac felis quis tortor malesuada pretium. Pellentesque auctor neque nec urna. Proin sapien ipsum, porta a, auctor quis, euismod ut, mi. Aenean viverra rhoncus pede. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut non enim eleifend felis pretium feugiat. Vivamus quis mi. Phasellus a est. Phasellus magna. In hac habitasse platea dictumst. Curabitur at lacus ac velit ornare lobortis. Curabitur a felis in nunc fringilla tristique. Morbi mattis ullamcorper velit. Phasellus gravida semper nisi. Nullam vel sem. Pellentesque libero tortor, tincidunt et, tincidunt eget, semper nec, quam. Sed hendrerit. Morbi ac felis. Nunc egestas, augue at pellentesque laoreet, felis eros vehicula leo, at malesuada velit leo quis pede. Donec interdum, metus et hendrerit aliquet, dolor diam sagittis ligula, eget egestas libero turpis vel mi. Nunc nulla. Fusce risus nisl, viverra et, tempor et, pretium in, sapien. Donec venenatis vulputate lorem. Morbi nec metus. Phasellus blandit leo ut odio. Maecenas ullamcorper, dui et placerat feugiat, eros pede varius nisi, condimentum viverra felis nunc et lorem. Sed magna purus, fermentum eu, tincidunt eu, varius ut, felis. In auctor lobortis lacus. Quisque libero metus, condimentum nec, tempor a, commodo mollis, magna. Vestibulum ullamcorper mauris at ligula. Fusce fermentum. Nullam cursus lacinia erat. Praesent blandit laoreet nibh. Fusce convallis metus id felis luctus adipiscing. Pellentesque egestas, neque sit amet convallis pulvinar, justo nulla eleifend augue, ac auctor orci leo non est. Quisque id mi. Ut tincidunt tincidunt erat. Etiam feugiat lorem non metus. Vestibulum dapibus nunc ac augue. Curabitur vestibulum aliquam leo. Praesent egestas neque eu enim. In hac habitasse platea dictumst. Fusce a quam. Etiam ut purus mattis mauris sodales aliquam. Curabitur nisi. Quisque malesuada placerat nisl. Nam ipsum risus, rutrum vitae, vestibulum eu, molestie vel, lacus. Sed augue ipsum, egestas nec, vestibulum et, malesuada adipiscing, dui. Vestibulum facilisis, purus nec pulvinar iaculis, ligula mi congue nunc, vitae euismod ligula urna in dolor. Mauris sollicitudin fermentum libero. Praesent nonummy mi in odio. Nunc interdum lacus sit amet orci. Vestibulum rutrum, mi nec elementum vehicula, eros quam gravida nisl, id fringilla neque ante vel mi. Morbi mollis tellus ac sapien. Phasellus volutpat, metus eget egestas mollis, lacus lacus blandit dui, id egestas quam mauris ut lacus. Fusce vel dui. Sed in libero ut nibh placerat accumsan. Proin faucibus arcu quis ante. In consectetuer turpis ut velit. Nulla sit amet est. Praesent metus tellus, elementum eu, semper a, adipiscing nec, purus. Cras risus ipsum, faucibus ut, ullamcorper id, varius ac, leo. Suspendisse feugiat. Suspendisse enim turpis, dictum sed, iaculis a, condimentum nec, nisi. Praesent nec nisl a purus blandit viverra. Praesent ac massa at ligula laoreet iaculis. Nulla neque dolor, sagittis eget, iaculis quis, molestie non, velit. Mauris turpis nunc, blandit et, volutpat molestie, porta ut, ligula. Fusce pharetra convallis urna. Quisque ut nisi. Donec mi odio, faucibus at, scelerisque quis,",
      attachment: @posts_data[0][:attachment],
      createdAt: @posts_data[0][:createdAt],
    )
    expect(post.valid?).to be(false)
    end
  end
  describe 'hash' do
    it 'make hash' do 
      post = Posts.new(
      id: @posts_data[0][:id], 
      id_user: @posts_data[0][:id_user],
      caption: @posts_data[0][:caption],
      attachment: @posts_data[0][:attachment],
      createdAt: @posts_data[0][:createdAt],
    )
    expect(post.make_hash()).to eq(@posts_data[0])
    end
  end
  describe 'find post by id' do
    it 'find post and give empty result' do
      query = "select * from Posts where id = #{@posts_data[0][:id]}"
     allow(@client).to receive(:query).with(query).and_return([])
     expect(Posts::find_post_by_id(@posts_data[0])).to eq([]) 
    end
    it 'find post and give result' do
      post = Posts.new(
      id: @posts_data[0][:id], 
      id_user: @posts_data[0][:id_user],
      caption: @posts_data[0][:caption],
      attachment: @posts_data[0][:attachment],
      createdAt: @posts_data[0][:createdAt],
    )
      query = "select * from Posts where id = #{@posts_data[0][:id]}"
     allow(@client).to receive(:query).with(query).and_return(@posts_data[0])
     expect(Posts::find_post_by_id(@posts_data[0]).length).to eq(1) 
    end
  end

  describe 'find post by id to json' do
    it 'find post and give empty result' do
      query = "select * from Posts where id = #{@posts_data[0][:id]}"
     allow(@client).to receive(:query).with(query).and_return([])
     expect(Posts::find_post_by_id(@posts_data[0])).to eq([]) 
    end
    it 'find post and give result' do
      post = {
        id: 1, 
        id_user: "teset",
        caption: "test",
        attachment: "test",
        createdAt: "Test",
      }
      query = "select * from Posts where id = #{1}"
     allow(@client).to receive(:query).with(query).and_return(post)
     expect(Posts::post_by_id_json(id: 1)).to eq(post) 
    end
  end

  it "should return list hastag" do
    params = {
      :id => 1,
      :user_id => 3,
      :caption => "Test #mantap #luarbiasa",
      :attachment => '/public/upload/test.jpg',
      :createdAt => '2021-08-20 11:48:38'
    }
    post = Posts.new(
      id: 1, 
      id_user: 3,
      caption: "Test #mantap #luarbiasa",
      attachment: '/public/upload/test.jpg',
      createdAt:'2021-08-20 11:48:38'
    )
    expect(post.find_hastag_from_caption("Test #mantap #luarbiasa")).to eq(["#mantap", "#luarbiasa"])
  end

  it 'save post' do
    param ={
      id: 1, 
      id_user: 1,
      caption: 'test #test #test2',
      attachment: 'test',
      createdAt: '2021-08-20 11:48:38'
    }
    query ="INSERT INTO Posts (id_user,caption,attachment) VALUES (#{param[:id]},'#{param[:caption]}', '#{param[:attachment]}')"
    allow(@client).to receive(:query).with(query)
    allow(@client).to receive(:last_id).and_return(1)
    hastag = double
    post = double
    allow(post).to receive(:find_hastag_from_caption).and_return(["#test"])
    hastag = double
    allow(hastag).to receive(:exist?).and_return(false)
    allow(hastag).to receive(:save)
    allow(Hastags).to receive(:find_id).and_return(1)
    allow(Hastags).to receive(:new).and_return(hastag)
    query2= "INSERT INTO Hastag_contracts (id_post, id_hastag) VALUES (1, 1)"
    expect(@client).to receive(:query).with(query2)
    post = Posts.new(
      id: 1, 
      id_user: 1,
      caption: 'test #test #test2',
      attachment: 'test',
      createdAt: '2021-08-20 11:48:38'
    )
    expect(post.save).to eq(true)
  end
end