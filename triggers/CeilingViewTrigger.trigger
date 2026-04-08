trigger CeilingViewTrigger on Ceiling_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingViewHandler.handleAfterDelete(Trigger.old);
    }
}
