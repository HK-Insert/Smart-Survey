<template>
    <div class="main-container">

        <Header />

        <Breadcrumb :items="items" title="설문 등록" />

        <AdminWrapper />

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
    import AdminWrapper from '@/components/sections/2.SurveyRegistration/_AD_AdminWrapper'
    import Footer from '@/components/_Footer';
    import OffCanvasMobileMenu from '@/components/_OffCanvasMobileMenu'

    export default {
        components: {
            Header,
            Breadcrumb,
            AdminWrapper,
            Footer,
            OffCanvasMobileMenu
        },
        data() {
            return {
                items: [
                    {
                        text: 'Home',
                        to: "/"
                    },
                    {
                        text: 'Blog Details',
                        active: true
                    }
                ]
            }
        },
        metaInfo: {
            title: '서베이존 - 설문 등록',
            htmlAttrs: {
                lang: 'ko',
                amp: true
            }
        }
    }
</script>

