trigger AlertBridgeTrigger on Alert_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
