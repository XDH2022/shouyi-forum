import {defineStore} from 'pinia';
import {getCurrentInfo} from "../api/user";


export const useUserStore = defineStore('user', {
    state: () => {
        return {
            currentUser: {}
        };
    },
    getters: {},
    actions: {
        async getUserInfo() {
            const token = localStorage.getItem('acp_token')
            const result = await getCurrentInfo(token)
            if (result.code == 0) {
                this.currentUser = result.data
            } else {
                localStorage.removeItem('acp_token')
            }
        }
    }
});
