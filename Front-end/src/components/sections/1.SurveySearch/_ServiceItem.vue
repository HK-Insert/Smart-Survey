<template>
  <div class="service-grid-item">
    <div class="service-grid-item__image">
      <div class="service-grid-item__image-wrapper">
        <router-link to="/service-details">
          <img
            :src="
              require('../../../../src/assets/img/category/' + `${imagename}`)
            "
            class="img-fluid"
            alt="service thumb"
          />
        </router-link>
      </div>
      <div class="icon" style="color: white">
        <i :class="service.icon"></i>
      </div>
    </div>
    <div class="service-grid-item__content">
      <h3 class="title">
        <router-link to="_ModalSelect">
          <!-- {{ convertcatekor(interestlist) }} 관련 설문조사 -->
          {{ service.title }}
        </router-link>
      </h3>
      <p class="subtitle">{{ service.desc }}</p>
      <!-- <router-link class="see-more-link" to="/service-details"
        >참여하기</router-link
      > -->
    </div>
  </div>
</template>

<script>
export default {
  props: ["service", "imagename", "interestlist"],
  data() {
    return {};
  },
  methods: {
    convertcatekor(listName) {
      return this.$store.state.kor_category[
        this.$store.state.eng_category.indexOf(listName)
      ];
    },
  },
};
</script>
