trigger AlertRelayTrigger on Alert_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertRelayHandler.handleAfterDelete(Trigger.old);
    }
}
