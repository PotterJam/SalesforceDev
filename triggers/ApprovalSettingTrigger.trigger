trigger ApprovalSettingTrigger on Approval_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalSettingHandler.handleAfterDelete(Trigger.old);
    }
}
