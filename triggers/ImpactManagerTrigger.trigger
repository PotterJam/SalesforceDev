trigger ImpactManagerTrigger on Impact_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactManagerHandler.handleAfterDelete(Trigger.old);
    }
}
