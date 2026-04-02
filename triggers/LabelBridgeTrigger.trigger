trigger LabelBridgeTrigger on Label_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
