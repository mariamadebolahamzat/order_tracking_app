enum StatusEnum {
  placed('ORDER PLACED'),
  accepted('ORDER ACCEPTED'),
  pickUp('ORDER PICK UP IN PROGRESS'),
  roadToCustomer('ORDER ON THE WAY TO CUSTOMER'),
  arrived('ORDER ARRIVED'),
  delivered('ORDER DELIVERED');

  const StatusEnum(this.value);
  final String value;

  static StatusEnum fromValue(String val) {
    switch (val) {
      case 'ORDER PLACED':
        return StatusEnum.placed;
      case 'ORDER ACCEPTED':
        return StatusEnum.accepted;
      case 'ORDER PICK UP IN PROGRESS':
        return StatusEnum.pickUp;
      case 'ORDER ON THE WAY TO CUSTOMER':
        return StatusEnum.roadToCustomer;
      case 'ORDER ARRIVED':
        return StatusEnum.arrived;
      case 'ORDER DELIVERED':
        return StatusEnum.delivered;
      default:
        return StatusEnum.placed;
    }
  }
}
