<template>
    <div class="main-container">

        <Header />

        <Breadcrumb :items="items" title="관심사 설정" />

        <FavoriteDetail />
        <Footer />

        <OffCanvasMobileMenu />

        <!-- back to top start -->
        <back-to-top class="scroll-top" bottom="60px">
            <i class="ion-android-arrow-up"></i>
        </back-to-top>
        <!-- back to top end -->
    </div>
</template>

<script>

    import Header from '@/components/_Header';
    import Breadcrumb from '@/components/Breadcrumb'
    import FavoriteDetail from '@/components/sections/4.MyPage/_MP_FavoriteDetail'
    import Footer from "@/components/_Footer";
    import OffCanvasMobileMenu from '@/components/_OffCanvasMobileMenu';

    export default {
        components: {
            Header,
            Breadcrumb,
            OffCanvasMobileMenu,
            FavoriteDetail,
            Footer
        },
        data() {
            return {
                items: [
                    {
                        text: '마이페이지',
                        to: "/"
                    },
                    {
                        text: '관심사 설정',
                        active: true
                    }
                ]
            }
        },
        metaInfo: {
            title: '서베이존 - 관심사 설정',
            htmlAttrs: {
                lang: 'ko',
                amp: true
            }
        }
    }
</script>

