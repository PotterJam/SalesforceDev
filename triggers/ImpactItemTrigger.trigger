trigger ImpactItemTrigger on Impact_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactItemHandler.handleAfterDelete(Trigger.old);
    }
}
