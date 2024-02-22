<script setup></script>
<template>
    <aside class="control-sidebar control-sidebar-dark">
        <div class="p-3 control-sidebar-content">
            <h5>Navigation Preferences</h5>
            <hr class="mb-2">
            <div class="mb-4">
                <input type="checkbox" value="1" class="mr-1">
                <span>Dark Mode</span>
            </div>
            <h6>Other Options</h6>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Fixed</span></div>
        </div>
    </aside>
</template>
<style scoped></style>
<script>
export default {
    data: () => ({
        //
    }),
    mounted() {

    },
    methods: {
        /* navIsActive: function() {
            this.isActive = !this.isActive;
            // some code to filter users
        } */
    }
}
</script>