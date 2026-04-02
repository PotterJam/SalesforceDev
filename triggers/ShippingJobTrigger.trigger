trigger ShippingJobTrigger on Shipping_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingJobHandler.handleAfterDelete(Trigger.old);
    }
}
