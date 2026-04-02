trigger LabelRelayTrigger on Label_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelRelayHandler.handleAfterDelete(Trigger.old);
    }
}
