trigger DeliverableRelayTrigger on Deliverable_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableRelayHandler.handleAfterDelete(Trigger.old);
    }
}
