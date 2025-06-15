export const orderDetail = {
  order_Detail_Id: 0,
  order_Id: 0,
  order: null,
  product_Id: 0,
  product: null,
  quantity: 0,
  price: 0,
  product_Name: "",
  img1: "",
  img1_Data_64: "",
};

export const ordersTracking = {
  order_Id: 0,
  update_Status_Date: null, // DateTime -> null (hoặc new Date())
  update_By: "",
  step: "",
  step_Text: "",
  deleted: 0,
};

export const orderInfo = {
  order_Id: 0,
  customer_Id: 0,
  customer: null, // Customer object, có thể null hoặc một object tương ứng
  order_Date: null, // DateTime tương ứng có thể null hoặc Date object
  customer_Name: "",
  address: "",
  city: "",
  district: "",
  province: "",
  settle_Type: "",
  phone: "",
  total_Order_Value: 0,
  order_Status: "",
  order_Status_Text: "",
  payment: null, // Payment object, có thể null hoặc object tương ứng
  orderDetails: [], // List<OrderDetail> tương ứng array rỗng hoặc các object OrderDetail
  orderTrackings: [], // List<OrdersTracking>
  test: "",
  track_Id: "",
};

export const productInfo = {
  product_Id: 0, // int
  product_Name: "",
  description: "",
  price: 0, // decimal
  stock_Quantity: 0, // int
  category_Id: 0, // int
  category_Name: "",
  img1: "",
  img2: "",
  img3: "",

  img1_File: null, // tương đương IFormFile, để null hoặc object file nếu cần
  img2_File: null,
  img3_File: null,

  img1_Data_Byte: null, // tương đương byte[] trong JS là Uint8Array hoặc Buffer, để null hoặc mảng byte
  img2_Data_Byte: null,
  img3_Data_Byte: null,

  img1_Data_64: "", // base64 string

  created_By: "",
  modified_By: "",
  created_Date: null, // DateTime -> JS Date object hoặc null
  modified_Date: null,

  deleted: 0, // decimal
};
