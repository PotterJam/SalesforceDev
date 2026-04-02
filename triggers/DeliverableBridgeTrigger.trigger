trigger DeliverableBridgeTrigger on Deliverable_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
