import {
  POST_CART_BEGIN,
  POST_CART_SUCCESS,
  POST_CART_FAIL,
  GET_CART_BY_USERID_BEGIN,
  GET_CART_BY_USERID_SUCCESS,
  GET_CART_BY_USERID_FAIL, ADD_TO_CART, RESTORE_CART_LOCALSTORAGE, REMOVE_FROM_CART
} from "../actions/cartAction";

const initialState = {
  cartItems: [],
  loading: false,
  error: {},
  totalItems: 0,
};

export default (state = initialState, action) => {
  switch (action.type) {
    case POST_CART_BEGIN:
      return {
        ...state,
        loading: true,
        error: {}
      };
    case POST_CART_SUCCESS:
      return {
        ...state,
        cartItems: action.payload.data.cart,
        loading: false,
        totalItems: action.payload.data.cart?.length || 0
      };
    case POST_CART_FAIL:
      return {
        ...state,
        loading: false,
        error: action.payload.error.response.data
      };
    case GET_CART_BY_USERID_BEGIN:
      return {
        ...state,
        loading: true,
        error: {}
      };
    case GET_CART_BY_USERID_SUCCESS:
      return {
        ...state,
        cartItems: action.payload.data.cart,
        loading: false,
        totalItems: action.payload.data.cart?.length || 0
      };
    case GET_CART_BY_USERID_FAIL:
      return {
        ...state,
        loading: false,
        error: action.payload.error.response.data
      };
    case REMOVE_FROM_CART:
      console.log(`REMOVE_FROM_CART=${JSON.stringify()}`);
      var id = action.payload.product_Id;
      console.log(`id=${JSON.stringify(id)}`);
      const DataAferRemove = state && state.cartItems && Array.isArray(state.cartItems) ? state.cartItems.filter(item => item.product_Id != action.payload.product_Id) : null;
      console.log(`DataAferRemove=${JSON.stringify(DataAferRemove.length)}`);
      return {
        ...state,
        cartItems: DataAferRemove,
        totalItems: DataAferRemove?.length || 0, // Tính tổng số sản phẩm
      }
    case ADD_TO_CART:
      const existingItem = state && state.cartItems && Array.isArray(state.cartItems) ? state.cartItems.find(item => item.product_Id === action.payload.product_Id) : null;
      let _qtty = (action && action.payload.quantity) || 1
      if (existingItem) {
        // Nếu đã tồn tại, cập nhật số lượng của sản phẩm
        const updateItems = state.cartItems.map(item => {
          if (item.product_Id === action.payload.product_Id) {
            return {
              ...item,
              quantity: item.quantity + _qtty, // Hoặc cập nhật số lượng theo cách bạn muốn
            };
          }
          return item;
        });
        return {
          ...state,
          cartItems: updateItems,
          totalItems: updateItems?.length || 0, // Tính tổng số sản phẩm
        }

      } else {
        // Nếu chưa tồn tại, thêm sản phẩm vào giỏ hàng
        const newItems = [...state.cartItems, { ...action.payload, quantity: _qtty }];
        return {
          ...state,
          cartItems: newItems,
          totalItems: newItems?.length || 0, // Tính tổng số sản phẩm
        };
      }
    case RESTORE_CART_LOCALSTORAGE:
      // Xử lý khôi phục dữ liệu từ Local Storage
      if (action.payload) {
        return action.payload;
      }
      return state;
    default:
      return state;
  }
};
