trigger ImpactNodeTrigger on Impact_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactNodeHandler.handleAfterDelete(Trigger.old);
    }
}
