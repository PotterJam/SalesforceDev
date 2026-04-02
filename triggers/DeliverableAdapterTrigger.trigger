trigger DeliverableAdapterTrigger on Deliverable_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
