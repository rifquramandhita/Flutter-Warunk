part of 'customer_checkout_bloc.dart';

sealed class CustomerCheckoutEvent {
  const CustomerCheckoutEvent();
}

final class CustomerCheckoutEventFetchStarted extends CustomerCheckoutEvent {
  final List<CustomerCartEntity> items;
  const CustomerCheckoutEventFetchStarted(this.items);
}

final class CustomerCheckoutEventDeliveryChanged extends CustomerCheckoutEvent {
  final DeliveryMethod method;
  const CustomerCheckoutEventDeliveryChanged(this.method);
}

final class CustomerCheckoutEventExpeditionChanged extends CustomerCheckoutEvent {
  final String expedition;
  const CustomerCheckoutEventExpeditionChanged(this.expedition);
}

final class CustomerCheckoutEventVoucherRemoved extends CustomerCheckoutEvent {
  const CustomerCheckoutEventVoucherRemoved();
}

final class CustomerCheckoutEventAddressChanged extends CustomerCheckoutEvent {
  final CustomerAddressEntity address;
  const CustomerCheckoutEventAddressChanged(this.address);
}

final class CustomerCheckoutEventPaymentMethodChanged extends CustomerCheckoutEvent {
  final String methodKey;
  const CustomerCheckoutEventPaymentMethodChanged(this.methodKey);
}

final class CustomerCheckoutEventPaymentProofChanged extends CustomerCheckoutEvent {
  final File file;
  const CustomerCheckoutEventPaymentProofChanged(this.file);
}

final class CustomerCheckoutEventNotesChanged extends CustomerCheckoutEvent {
  final String notes;
  const CustomerCheckoutEventNotesChanged(this.notes);
}

final class CustomerCheckoutEventSubmit extends CustomerCheckoutEvent {
  const CustomerCheckoutEventSubmit();
}
