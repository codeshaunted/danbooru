require "test_helper"

module Sources
  class BoothTest < ActiveSupport::TestCase
    context "A booth post" do
      strategy_should_work(
        "https://booth.pm/en/items/3240411",
        image_urls: %w[
          https://booth.pximg.net/767c867a-c6c7-426b-80b6-894d92993db3/i/3240411/150d3a16-7339-4484-b95f-63638c0b75d2.png
          https://booth.pximg.net/767c867a-c6c7-426b-80b6-894d92993db3/i/3240411/1207a003-baf5-49b5-8010-e986dd00e63a.jpg
          https://booth.pximg.net/767c867a-c6c7-426b-80b6-894d92993db3/i/3240411/ce9b3c6c-5f00-47b0-9bd1-fb9619a36531.jpg
        ],
        profile_url: "https://cullmee.booth.pm",
        page_url: "https://booth.pm/en/items/3240411",
        artist_name: "くるみ",
        tag_name: "cullmee",
        other_names: %w[cullmee くるみ],
        tags: %w[アイドルマスターシャイニーカラーズ アクリルスタンド二次創作 シャニマス 月岡恋鐘],
        artist_commentary_title: "月岡恋鐘 日本横断フェア アクリルスタンド",
        dtext_artist_commentary_desc: <<~EOS.chomp
          歌姫庭園28にて頒布した月岡恋鐘(日本横断フェア衣装)のアクリルスタンド
          高さ140mm×幅8mm(約)
          厚さ3mm
        EOS
      )
    end

    context "An active booth image" do
      strategy_should_work(
        "https://booth.pximg.net/767c867a-c6c7-426b-80b6-894d92993db3/i/3240411/150d3a16-7339-4484-b95f-63638c0b75d2.png",
        image_urls: %w[
          https://booth.pximg.net/767c867a-c6c7-426b-80b6-894d92993db3/i/3240411/150d3a16-7339-4484-b95f-63638c0b75d2.png
        ],
        profile_url: "https://cullmee.booth.pm",
        page_url: "https://booth.pm/en/items/3240411",
        artist_name: "くるみ",
        tag_name: "cullmee",
        other_names: %w[cullmee くるみ],
        tags: %w[アイドルマスターシャイニーカラーズ アクリルスタンド二次創作 シャニマス 月岡恋鐘],
        artist_commentary_title: "月岡恋鐘 日本横断フェア アクリルスタンド",
        dtext_artist_commentary_desc: <<~EOS.chomp
          歌姫庭園28にて頒布した月岡恋鐘(日本横断フェア衣装)のアクリルスタンド
          高さ140mm×幅8mm(約)
          厚さ3mm
        EOS
      )
    end

    context "A deleted booth image" do
      strategy_should_work(
        "https://booth.pximg.net/a212cd73-75ab-482d-8fce-1ce2965e4d4f/i/3713604/d12bce50-a0c7-43f8-a4fb-5ee0ea6855a3_base_resized.jpg",
        image_urls: ["https://booth.pximg.net/a212cd73-75ab-482d-8fce-1ce2965e4d4f/i/3713604/d12bce50-a0c7-43f8-a4fb-5ee0ea6855a3.jpg"],
        page_url: "https://booth.pm/en/items/3713604",
        profile_url: nil,
        artist_name: nil,
        tag_name: nil,
        other_names: [],
        tags: [],
        artist_commentary_title: nil,
        dtext_artist_commentary_desc: "",
      )
    end

    context "A booth post with artist name in the url" do
      strategy_should_work(
        "https://re-face.booth.pm/items/2423989",
        image_urls: ["https://booth.pximg.net/8bb9e4e3-d171-4027-88df-84480480f79d/i/2423989/a692d4f3-4371-4a86-a337-83fee82d46a4.png"],
        profile_url: "https://re-face.booth.pm",
        page_url: "https://booth.pm/en/items/2423989",
        artist_name: "Re:fAce/りふぇいす。",
        tag_name: "re-face",
        other_names: %w[Re:fAce/りふぇいす。 re-face],
        tags: %w[music original re:face ricchan\ * virtual\ youtuber くるみ だてんちゆあ ひなの羽衣 りふぇいす。 アイドル 千草はな 白乃クロミ 白咲べる 赤坂まさか 音楽],
        artist_commentary_title: "RwithV vol.1 -アイドルはじめます！-",
        dtext_artist_commentary_desc: /注文が殺到した際は、発送が遅れてしまう場合もございますので予めご了承ください。/
      )
    end

    context "A profile background picture" do
      strategy_should_work(
        "https://s2.booth.pm/8bb9e4e3-d171-4027-88df-84480480f79d/3d70de06-8e7c-444e-b8eb-a8a95bf20638_base_resized.jpg",
        image_urls: ["https://s2.booth.pm/8bb9e4e3-d171-4027-88df-84480480f79d/3d70de06-8e7c-444e-b8eb-a8a95bf20638.png"],
        page_url: nil,
        profile_url: nil,
        artist_name: nil,
        tag_name: nil,
        other_names: [],
        tags: [],
        artist_commentary_title: nil,
        artist_commentary_desc: nil,
      )
    end

    context "A profile icon" do
      strategy_should_work(
        "https://booth.pximg.net/c/128x128/users/3193929/icon_image/5be9eff4-1d9e-4a79-b097-33c1cd4ad314_base_resized.jpg",
        image_urls: ["https://booth.pximg.net/users/3193929/icon_image/5be9eff4-1d9e-4a79-b097-33c1cd4ad314.png"],
        page_url: nil,
        profile_url: nil,
        artist_name: nil,
        tag_name: nil,
        other_names: [],
        tags: [],
        artist_commentary_title: nil,
        artist_commentary_desc: nil,
      )
    end

    context "A non-existing or deleted post" do
      strategy_should_work(
        "https://booth.pm/en/items/2003079",
        deleted: true,
        page_url: "https://booth.pm/en/items/2003079",
        profile_url: nil,
        artist_name: nil,
        tag_name: nil,
        other_names: [],
        tags: [],
        artist_commentary_title: nil,
        artist_commentary_desc: nil,
      )
    end

    should "Parse Booth URLs correctly" do
      assert(Source::URL.image_url?("https://booth.pximg.net/8bb9e4e3-d171-4027-88df-84480480f79d/i/2864768/00cdfef0-e8d5-454b-8554-4885a7e4827d_base_resized.jpg"))
      assert(Source::URL.image_url?("https://s2.booth.pm/b242a7bd-0747-48c4-891d-9e8552edd5d7/i/3746752/52dbee27-7ad2-4048-9c1d-827eee36625c_base_resized.jpg"))
      assert(Source::URL.image_url?("https://s.booth.pm/1c9bc77f-8ac1-4fa4-94e5-839772ab72cb/i/750997/774dc881-ce6e-45c6-871b-f6c3ca6914d5.png"))
      assert(Source::URL.image_url?("https://booth.pximg.net/users/3193929/icon_image/5be9eff4-1d9e-4a79-b097-33c1cd4ad314.png"))
      assert(Source::URL.image_url?("https://s2.booth.pm/8bb9e4e3-d171-4027-88df-84480480f79d/3d70de06-8e7c-444e-b8eb-a8a95bf20638.png"))
      assert(Source::URL.page_url?("https://booth.pm/en/items/2864768"))
      assert(Source::URL.page_url?("https://re-face.booth.pm/items/3435711"))
      assert(Source::URL.profile_url?("https://re-face.booth.pm"))
      refute(Source::URL.profile_url?("https://www.booth.pm"))
      refute(Source::URL.profile_url?("https://booth.pm"))
    end
  end
end
