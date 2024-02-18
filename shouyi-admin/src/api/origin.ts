import request from '../utils/request';

export const getAllOriginInfo = (data: any) => {
    return request({
        url: '/origin/GetOriginByQueryAndPage',
        method: 'post',
        data: data
    });
};

export const addToOrigin = (data: any) => {
    return request({
        url: '/origin/addOrigin',
        method: 'post',
        data: data
    });
};

export const updateToOrigin = (data: any) => {
    return request({
        url: '/origin/updateOrigin',
        method: 'post',
        data: data
    });
};

export const deleteToOrigin = (data: any) => {
    return request({
        url: '/origin/deleteOrigin',
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
