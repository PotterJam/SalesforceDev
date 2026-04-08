trigger LabelNodeTrigger on Label_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelNodeHandler.handleAfterDelete(Trigger.old);
    }
}
