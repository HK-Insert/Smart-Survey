<template>
   
        <span id="logo-container"></span>
    
</template>
<script>
    const ModelViewer = require('@metamask/logo');

    export default {
        name: '',
        components: {},
        data() {
            return {
                sampleData: ''
            }
        },
        created() {},
        mounted() {
            const viewer = ModelViewer({
                // Dictates whether width & height are px or multiplied
                pxNotRatio: true,
                width: 30,
                height: 30,
                // pxNotRatio: false,
                // width: 0.9,
                // height: 0.9,

                // To make the face follow the mouse.
                followMouse: false,

                // head should slowly drift (overrides lookAt)
                slowDrift: false,
            });

            // add viewer to DOM
            const container = document.getElementById('logo-container');
            container.appendChild(viewer.container);

            // look at something on the page
            viewer.lookAt({
                x: 100,
                y: 100,
            });

            // enable mouse follow
            viewer.setFollowMouse(true);

            // deallocate nicely
            viewer.stopAnimation();
        },
        updated() {},
        unmounted() {},
        methods: {}
    }
</script>
<style scoped>
.btn-dark {
    color: #2B2423 ;
  }
</style>