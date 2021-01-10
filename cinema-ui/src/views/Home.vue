<template>
<div class="home">
<b-carousel
  id="carousel-1"
  v-model="slide"
  :interval="5555"
  controls
  indicators
  background="#ababab"
  img-width="1000"
  img-height="300"
  style="text-shadow: 1px 1px 2px #333;"
  @sliding-start="onSlideStart"
  @sliding-end="onSlideEnd"
>
  <!-- Text slides with image -->
  <b-carousel-slide
    caption="Кино Мегами"
    text=""
    img-src="https://images.unsplash.com/photo-1573727951373-ac2b41ed1400?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=2500&q=80"
  ></b-carousel-slide>

  <!-- Slides with custom text -->
  <b-carousel-slide img-src="http://www.mydailywallpaper.com/wallcat/space/bg_wall.jpg">
  <!-- <b-carousel-slide img-src="/pictures/slide1.jpg"> -->
    <h1></h1>
  </b-carousel-slide>

  <!-- Slides with image only -->
  <b-carousel-slide img-src="https://greenwichinlondon.com/wp-content/uploads/2013/03/movies-filmed-in-greenwich-slider.jpg"></b-carousel-slide>

  <!-- Slides with img slot -->
  <!-- Note the classes .d-block and .img-fluid to prevent browser default image alignment -->
  <b-carousel-slide>
    <template #img>
      <img
        class="d-block img-fluid w-100"
        width="1000"
        height="300"
        src="https://www.remarkablehoneymoons.com/wp-content/uploads/tahiti-nui-sale-1000x200.jpg"
        alt="image slot"
      >
    </template>
  </b-carousel-slide>
</b-carousel>
<template>
  <h5 class="p-5"></h5>
  <p style="font-size:120%;"><img src="https://mmtvmusic.com/wp-content/uploads/2019/12/parvia-bulgarski-kino-salon-mmtv-f.jpg"  width="450" height="222" style="float:left">Първите кинопрожекции в България са се състояли в началото на декември 1896 г. в София, от професор Мелинсон в салона на хотел „Македония“ и кафене „България“. Според вестник „МИР“ са прожектирани „пет хубави картини из живота, предадени много добре от киноматографа“. Доскоро се знаеше, че първата кинопрожекция се е състояла през 1897 г. в заведението на Марин Чолаков в град Русе. Собственик на кинематографическата машина и организатор на събитието бил Георги Кузмич. Той прожектирал филм, който показвал посрещането на цар Николай в Париж, един от парижките площади и движещ се влак. Месец по-късно, на 22 март, била организирана поредната прожекция в София.</p><h5 class="p-5"></h5>
  <p style="font-size:120%;"><img src="https://static.dir.bg/uploads/images/2020/01/12/1937276/768x432.jpg?_=1578852318"  width="450" height="220" style="float:right"> Комедията „Българан е галант е първият български игрален филм. Прожектиран е за първи път на 13 януари 1915 г. и съобразно технологиите в киното по това време, филмът е черно-бял и „ням“. Сценарист, режисьор и изпълнител на главната роля е Васил Гендов. Смята се, че филмът е загубен и са останали едва 1 – 2 кадъра от него.</p><h5 class="p-5"></h5>
  <p><img src="https://scifi.bg/wp-content/uploads/2017/02/cinema.jpg"  width="900" height="300" style="vertical-align:middle"></p>
  <p style="font-size:120%;">Кино Мегами е най-новото кино в България. Предлага последните филми на пазара и на достъпни цени. Качестовото е просто съвършено няма друго такова.Пуканките и питиетата са безплатни за редовни клиенти. Само тук може да гледате вашите любими филми на 100D. Гарантирано преживяване, идеалното място за млади двойки и девойки!!</p><h5 class="p-5"></h5>
  <footer class="bg-dark text-center text-lg-start">
     <div class="text-center p-2" style="background-color: rgba(0, 0, 0, 0)">
      <p style="font-size:120%;" class="text-light" >МЕГАМИ</p>
    </div>
  </footer>
</template>
</div>
</template>
<script>
export default {
  data () {
    return {
      slide: 0,
      sliding: null
    }
  },
  methods: {
    onSlideStart (slide) {
      this.sliding = true
    },
    onSlideEnd (slide) {
      this.sliding = false
    }
  }
}
</script>
