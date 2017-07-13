select sr_num, trunc(a.created) cre,trunc(POST_MORTEM_RVW_DT) resol,trunc(ACT_CLOSE_DT) cls,fst_name || ' ' || last_name Owner,ins_product  
from siebel.s_srv_req a, siebel.s_contact b where a.OWNER_EMP_ID = b.row_id and SR_SUBTYPE_CD <> 'MSDB' 
and ins_product in ('General Feedback','Compliments','Query','Complaints') 
and a.created between '01-NOV-2014' and '30-NOV-2014' 