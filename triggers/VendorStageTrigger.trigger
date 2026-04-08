trigger VendorStageTrigger on Vendor_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorStageHandler.handleAfterDelete(Trigger.old);
    }
}
