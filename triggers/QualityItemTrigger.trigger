trigger QualityItemTrigger on Quality_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityItemHandler.handleAfterDelete(Trigger.old);
    }
}
