trigger ImpactFilterTrigger on Impact_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactFilterHandler.handleAfterDelete(Trigger.old);
    }
}
