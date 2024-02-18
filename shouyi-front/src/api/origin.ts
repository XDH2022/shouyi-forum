import request from '../plugins/myAxios';

export const getOriginInfo = (data: any) => {
    return request({
        url: '/origin/GetOriginByQueryAndPage',
        method: 'post',
        data: data
    });
};

export const doOriginInfo = (data: any) => {
    return request({
        url: '/origin/addOrigin',
        method: 'post',
        data: data
    });
};
export const getOriginByUser = (data: any) => {
    return request({
        url: '/origin/GetOriginByUser',
        method: 'post',
        data: data
    });
};
