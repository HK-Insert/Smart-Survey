<template>
    <div>
        <div class="col-3 metamask_div desktop-menu-icon">
            <!-- 메타마스크 아이콘 시작-->
            <label class="metamask_Logo">
                <MetamaskLogo v-if="this.$store.state.metamaskAdd == null"/>
                <img :src="user_avatar" style="width: 2em" alt="" v-if="this.$store.state.metamaskAdd != null"/>
            </label>
            <!-- 메타마스크 아이콘 종료 -->

            <!-- 로그인 버튼 시작-->
            <label type="button" class="metamask_Logo_Button btn btn-dark" v-if="this.$store.state.metamaskAdd == null" style="width: 7em">
                로그인
                <Web3 />
            </label>
            <!-- 로그인 버튼 종료 -->

            <!-- 로그아웃버튼 시작 -->
            <label type="button" class="btn btn-dark metamask_Logo_Button" style="width: 8em"
            @click="logout()" v-show="this.$store.state.metamaskAdd != null">
                {{ this.$store.state.metamaskShortAdd }}
            </label>
            <!-- 로그아웃버튼 종료 -->
        </div>
    </div>
</template>

<script>
import Web3 from "@/components/_Web3";
import MetamaskLogo from "@/components/_MetamaskLogo";

export default {
  components: {
    Web3,
    MetamaskLogo,
  },
  data() {
    return {
      user_avatar: "",
    };
  },
  created() {
    this.userAvatar();
  },
  methods: {
    logout() {
      this.$store.commit("metamaskAdd", null);
    },
    userAvatar() {
      this.user_avatar =
        "https://identicon-api.herokuapp.com/" +
        this.$store.state.metamaskAdd +
        "/200?format=png";
    },
  },
};
</script>

<style lang="scss">
.desktop-menu-icon {
  /* Mobile Device */
  // 768px 미만 해상도의 모바일 기기를 위한 코드를 작성한다.
  //  모든 해상도에서 이 코드가 실행됨. 미디어 쿼리를 지원하지 않는 모바일 기기를 위해 미디어 쿼리 구문을 사용하지 않는다.
  display: none;

  @media all and (min-width: 1024px) {
    display: block;
    // 사용자 해상도가 1024px 이상일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다.
    .metamask_div {
      position: relative;
    }

    .metamask_Logo {
      border: 3px solid black;
      padding: 5px;
      border-radius: 30px;
      top: -18px;
      position: absolute;
      z-index: 3;
      background: white;
    }

    .metamask_Logo_Button {
      position: absolute;
      top: -15px;
      left: 40px;
      z-index: 1;
    }

    .btn-dark {
    background-color: #2B2423 ;
    border: #2B2423 3px solid;
  }

    .btn-dark:hover {
    background-color: white ;
    color: #2B2423;
    border: #2B2423 3px solid;
  }
  }
}
</style>