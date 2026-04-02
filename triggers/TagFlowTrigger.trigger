trigger TagFlowTrigger on Tag_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagFlowHandler.handleAfterDelete(Trigger.old);
    }
}
